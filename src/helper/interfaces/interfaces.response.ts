interface LoginResponse {
  token: string;
  user: {
    id: number;
    name: string;
    email: string;
    role: string;
  };
}

interface RegisterResponse {
  id: number;
  name: string;
  email: string;
  role: string;
  token: string;
}


interface UpdateProfileResponse {
  id: number;
  name: string;
  email: string;
  role: string;
  token: string;
}