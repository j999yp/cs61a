CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT dogs.name,sizes.size from dogs,sizes where dogs.height > sizes.min and dogs.height <= sizes.max;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT c.name from dogs as c,dogs as p,parents 
    where c.name = child and p.name = parent
    order by p.height desc;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT pa.child as a,pb.child as b from parents as pa,parents as pb
    where pa.parent = pb.parent and pa.child < pb.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT a || " and " || b || " are " || sizes.size || " siblings"
    from siblings,dogs as da,dogs as db,sizes 
    where a = da.name and da.height > sizes.min and da.height <= sizes.max
      and b = db.name and db.height > sizes.min and db.height <= sizes.max;


-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height, n);

-- Add your INSERT INTOs here
insert into stacks_helper select name,height,height,1 from dogs;
insert into stacks_helper select s.dogs || ", " || d.name,
                                 s.stack_height + d.height,
                                 d.height , 2
                          from stacks_helper as s,dogs as d
                          where d.height > s.last_height;
insert into stacks_helper select s.dogs || ", " || d.name,
                                 s.stack_height + d.height,
                                 d.height , 3
                          from stacks_helper as s,dogs as d
                          where d.height > s.last_height;
insert into stacks_helper select s.dogs || ", " || d.name,
                                 s.stack_height + d.height,
                                 d.height , 4
                          from stacks_helper as s,dogs as d
                          where d.height > s.last_height;


CREATE TABLE stacks AS
  SELECT dogs,stack_height from stacks_helper where stack_height >= 170 and n = 4
    order by stack_height;

