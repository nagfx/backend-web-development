export const allProducts = [
  {
    id: 1,
    carLotId: 1,
    carModelId: 2,
    colour: "blue",
    price: 10000,
    regNo: "VEB1423",
    regDate: "2012-12-05",
    initialMileage: 300000,
    status: null,
  },
  {
    id: 2,
    carLotId: 1,
    carModelId: 3,
    colour: "red",
    price: 250000,
    regNo: null,
    regDate: null,
    initialMileage: 0,
    status: "sold",
  },
  {
    id: 3,
    carLotId: 2,
    carModelId: 1,
    colour: "black",
    price: 45000,
    regNo: "BEN8932",
    regDate: "2020-10-18",
    initialMileage: 30000,
    status: null,
  },
  {
    id: 4,
    carLotId: 1,
    carModelId: 4,
    colour: "grey",
    price: 25000,
    regNo: "TIK4532",
    regDate: "2018-12-05",
    initialMileage: 15000,
    status: null,
  },
  {
    id: 5,
    carLotId: 2,
    carModelId: 8,
    colour: "black",
    price: 600000,
    regNo: null,
    regDate: null,
    initialMileage: 0,
    status: "sold",
  },
];

class ProductService {
  getAllProducts = async () => {
    return allProducts;
  };

  getProductById = (id) => {
    return allProducts.find((product) => car.id === id);
  };
}

export default new ProductService();
